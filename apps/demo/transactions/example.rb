require "demo/transactions"

Demo::Transactions.define do |t|
  # Define your dry-transaction objects here:
  #
  # t.define "demo.transactions.users.sign_up" do
  #   step :persist, with: "demo.users.operations.sign_up"
  # end
end
