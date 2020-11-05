class App
  def all_companies
    Company.order(created_at: :desc).all
  end

  def all_polls
    Poll.order(created_at: :desc).all
  end
end
