class Admin::BaseController < ApplicationController
  before_action :is_user_admin?
end
