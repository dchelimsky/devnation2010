describe Purchase do
  context "when successful" do
    it "sends a message to ship the item" do
      ActiveMerchant::Billing::Base.mode = :test
      gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
      :login => 'TestMerchant', :password => 'password'       )       messenger = double()        messenger.should_receive(:ship).with(item)        purchase = Purchase.new(gateway, item, credit_card, messenger)       purchase.finalize     end
  end
end