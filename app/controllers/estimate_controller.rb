class EstimateController < ApplicationController
  def index
    test = policy_scope(Estimate)
    @estimates = Estimate.where(command_id: params[:id])
    @new_estimate = Estimate.new
    @command = Command.find(params[:id])
  end

  def create
    estimate = Estimate.new
    estimate.status = params["estimate"]["status"]
    estimate.estimate_file = params["estimate"]["estimate_file"]
    estimate.command_id = params["estimate"]["command_id"]
    authorize estimate
    estimate.save
    redirect_to estimate_index_path(id: estimate.command_id)
  end

  def update
    estimate = Estimate.find(params["id"])
    estimate.status = params["estimate"]["status"]
    estimate.estimate_file = params["estimate"]["estimate_file"]
    authorize estimate
    estimate.save
    redirect_to estimate_index_path(id: estimate.command_id)
  end
end
