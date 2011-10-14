class TestsController < ApplicationController
  def index
    @allTests = current_user.tests.all
  end

  def new
    @test = Test.new
  end

  def create
  end
end
