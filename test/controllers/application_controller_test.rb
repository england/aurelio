require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'common assign testings' do
    assert_difference('Testing.count', 4) do
      post testing_assignment_path, params: {
        user_ids: [users(:two).id],
        group_ids: [groups(:math).id],
        test_ids: [tests(:digits).id, tests(:words).id]
      }
    end

    assert_equal 'Assigned 2 tests to 2 users', flash[:notice]
  end
end
