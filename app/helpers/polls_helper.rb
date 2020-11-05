module PollsHelper
  def estimate_percent_vote(items, item_count)
    return "0%" if item_count.zero?

    total_count = items.collect { |item| count(item) }.sum
    "#{((item_count.to_f / total_count.to_f) * 100).round(1)}%"
  end

  def count(item)
    item.votes.map(&:counts).sum
  end

  def compute_total_votes(items)
    total = items.collect { |item| count(item) }.sum
    "#{total} vote#{total > 0 ? "s" : ""}"
  end
end
