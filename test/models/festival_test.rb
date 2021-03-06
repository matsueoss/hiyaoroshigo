require 'test_helper'

class FestivalTest < ActiveSupport::TestCase
  test "started?" do
    f = Festival.new(start_at: 1.second.since)
    assert_equal(false, f.started?)
    f = Festival.new(start_at: Time.current)
    assert_equal(true, f.started?)
    f = Festival.new(start_at: 1.second.ago)
    assert_equal(true, f.started?)
  end

  test "ended?" do
    f = Festival.new(end_at: 1.second.since)
    assert_equal(false, f.ended?)
    f = Festival.new(end_at: Time.current)
    assert_equal(true, f.ended?)
    f = Festival.new(end_at: 1.second.ago)
    assert_equal(true, f.ended?)
  end

  test "votable?" do
    f = Festival.new(start_at: 1.second.since, end_at: 2.second.since)
    assert_equal(false, f.votable?)
    f = Festival.new(start_at: Time.current, end_at: 1.second.since)
    assert_equal(true, f.votable?)
    f = Festival.new(start_at: 1.second.ago, end_at: 1.second.since)
    assert_equal(true, f.votable?)
    f = Festival.new(start_at: 1.second.ago, end_at: Time.current)
    assert_equal(false, f.votable?)
  end

  test "winner" do
    sakes = Sake.all.map { |sake|
      sum_score = 10.times.map {
        Vote.create(drinking: Drinking.create(festival_id: 1, sake_id: sake.id),
                    score: rand(5) + 1).score
      }.sum
      [sake.id, sum_score]
    }
    Sake.all.each { |sake|
      # noise
      Vote.create(drinking: Drinking.create(festival_id: 2, sake_id: sake.id),
                  score: rand(5) + 1)
    }
    winner, = sakes.max_by { |_, sum_score| sum_score }
    assert_equal(winner, Festival.find(1).winner.id)
  end

  test "no winner" do
    assert_equal(nil, Festival.find(1).winner)
  end
end
