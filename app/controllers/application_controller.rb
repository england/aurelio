class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def testing_assignment
    users = (
      User.where(id: params[:user_ids]) +
      User.joins(:groups).where(groups: { id: params[:group_ids] })
    ).uniq(&:id)

    tests = Test.where(id: params[:test_ids])

    users.each { |user| user.tests.push(*tests) }

    flash[:notice] = "Assigned #{tests.count} tests to #{users.count} users" # FIXME: validate users & tests
  end
end
