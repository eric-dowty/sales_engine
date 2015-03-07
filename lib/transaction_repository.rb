# require './lib/transaction'
require_relative './transaction'

class TransactionRepository

  attr_accessor :transaction,
                :parent_engine

  def initialize(data, sales_engine)
    @parent_engine = sales_engine
    @transaction = data.map do |element|
      (element.kind_of? Transaction) ? element : (Transaction.new(self,element))
    end
  end

  def all
    TransactionRepository.new(
      transaction,
      parent_engine
    )
  end

  def random
    TransactionRepository.new(
      [transaction.sample],
      parent_engine
    )
  end

  def find_by_id(match)
    TransactionRepository.new(
      [transaction.find {|data| data.id == match}],
      parent_engine
    )
  end

  def find_by_invoice_id(match)  
    TransactionRepository.new(
      [transaction.find {|data| data.invoice_id == match}],
      parent_engine
    )
  end

  def find_by_credit_card_number(match)
    TransactionRepository.new(
      [transaction.find {|data| data.credit_card_number == match}],
      parent_engine
    )
  end

  def find_by_credit_card_expiration_date(match)
    TransactionRepository.new(
      [transaction.find {|data| data.credit_card_expiration_date == match}],
      parent_engine
    )
  end

  def find_by_result(match)
    TransactionRepository.new(
      [transaction.find {|data| data.result == match}],
      parent_engine
    )
  end

  def find_by_created_at(match)
    TransactionRepository.new(
      [transaction.find {|data| data.created_at.downcase == match.downcase}],
      parent_engine
    )
  end

  def find_by_updated_at(match)
    TransactionRepository.new(
      [transaction.find {|data| data.updated_at.downcase == match.downcase}],
      parent_engine
    )
  end

   def find_all_by_id(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.id == match},
      parent_engine
    )
  end

  def find_all_by_invoice_id(match)  
    TransactionRepository.new(
      transaction.find_all {|data| data.invoice_id == match},
      parent_engine
    )
  end

  def find_all_by_credit_card_number(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.credit_card_number == match},
      parent_engine
    )
  end

  def find_all_by_credit_card_expiration_date(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.credit_card_expiration_date == match},
      parent_engine
    )
  end

  def find_all_by_result(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.result == match},
      parent_engine
    )
  end

  def find_all_by_created_at(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.created_at.downcase == match.downcase},
      parent_engine
    )
  end

  def find_all_by_updated_at(match)
    TransactionRepository.new(
      transaction.find_all {|data| data.updated_at.downcase == match.downcase},
      parent_engine
    )
  end

  def inspect
    "#<#{self.class} #{merchants.size} rows>"
  end

end

# if __FILE__ == $0
  
# end