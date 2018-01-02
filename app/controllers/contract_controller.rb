class ContractController < ApplicationController
  def index
    test = policy_scope(Contract)
    @contracts = Contract.where(command_id: params[:id])
    @new_contract = Contract.new
    @command = Command.find(params[:id])
  end

  def create
    contract = Contract.new
    contract.contract_file = params["contract"]["contract_file"]
    contract.command_id = params["contract"]["command_id"]
    authorize contract
    contract.save
    redirect_to contract_index_path(id: contract.command_id)
  end

  def update
    contract = Contract.find(params["id"])
    contract.contract_file = params["contract"]["contract_file"]
    authorize contract
    contract.save
    redirect_to contract_index_path(id: contract.command_id)
  end
end
