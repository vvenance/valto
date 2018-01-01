class FeatureController < ApplicationController
  after_action :verify_authorized, except: :index

  def index
    @sheets = policy_scope(Feature)
    @features = Feature.where(command_id: params[:id])
    @command = Command.find(params[:id])
    authorize @features, :index?
    @new_feature = Feature.new
  end

  def show
    @feature = Feature.find(params[:id])
    authorize @feature
  end

  def update
  end

  def create
    feature = Feature.new
    feature.name = params['/feature']['name']
    feature.description = params['/feature']['description']
    feature.feature_file = params['/feature']['feature_file']
    feature.command_id = params['/feature']['command_id']
    feature.status = false
    authorize feature
    feature.save
    redirect_to feature_index_path(id: params['/feature']['command_id'])
  end
end
