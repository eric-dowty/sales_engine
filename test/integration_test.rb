require './test/test_helper'

class IntegrationTest < Minitest::Test 

  def test_a_merchant_can_retrieve_an_array_of_associated_items
    engine = SalesEngine.new
    engine.startup
    merchant = engine.merchants_repository.merchants[0]
    assert_equal 15,merchant.items.size
    assert_equal Array,merchant.items.class
  end

  def test_a_merchant_can_retrieve_an_array_of_associated_invoices
    engine = SalesEngine.new
    engine.startup
    merchant = engine.merchants_repository.merchants[0]
    assert_equal 59,merchant.invoices.size
    assert_equal Array,merchant.invoices.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_transactions
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoices_repository.invoices[0]
    assert_equal 1,invoice.transactions.size
    assert_equal Array,invoice.transactions.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_invoice_items
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoices_repository.invoices[0]
    assert_equal 8,invoice.invoice_items.size
    assert_equal Array,invoice.invoice_items.class
  end

  def test_an_invoice_can_retrieve_an_array_of_associated_items
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoices_repository.invoices[2]
    assert_equal 5,invoice.items.size
    assert_equal Array,invoice.items.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_customer
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoices_repository.invoices[0]
    assert_equal Customer,invoice.customer.class
  end

  def test_an_invoice_can_retrieve_an_instance_of_associated_merchant
    engine = SalesEngine.new
    engine.startup
    invoice = engine.invoices_repository.invoices[0]
    assert_equal Merchant,invoice.merchant.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new
    engine.startup
    invoice_item = engine.invoice_items_repository.invoice_items[0]
    assert_equal Invoice,invoice_item.invoice.class
  end

  def test_an_invoice_item_can_retrieve_an_instance_of_associated_item
    engine = SalesEngine.new
    engine.startup
    invoice_item = engine.invoice_items_repository.invoice_items[0]
    assert_equal Item,invoice_item.item.class
  end

  def test_an_item_can_retrieve_a_collection_of_asociated_invoice_items
    engine = SalesEngine.new
    engine.startup
    item = engine.items_repository.items[0]
    assert_equal 24,item.invoice_items.size
    assert_equal Array,item.invoice_items.class 
  end    

  def test_an_item_can_retrieve_an_instance_of_associated_merchant
    engine = SalesEngine.new
    engine.startup
    item = engine.items_repository.items[0]
    assert_equal Merchant,item.merchant.class
  end

  def test_a_transaction_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new
    engine.startup
    transaction = engine.transactions_repository.transactions[0]
    assert_equal Invoice,transaction.invoice.class
  end    

  def test_a_customer_can_retrieve_an_instance_of_associated_invoice
    engine = SalesEngine.new
    engine.startup
    customer = engine.customers_repository.customers[0]
    assert_equal Invoice,customer.invoice.class
  end  

end