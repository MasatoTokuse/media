require 'test_helper'

class ContentsControllerTest < ActionDispatch::IntegrationTest

  test "404 error page" do
    get '/test'
    assert_template 'errors/error_404'

    get '/test.xml'
    assert_template 'errors/error_404'

    get '/test.css'
    assert_template 'errors/error_404'

  end

end
