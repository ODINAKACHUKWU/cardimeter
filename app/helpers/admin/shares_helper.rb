module Admin::SharesHelper
  def get_shares(user)
    user.shares.select { |x| x.company_id == @company.id }.first
  end
end
