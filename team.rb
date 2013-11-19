require_relative ('standup')

class Team

  attr_reader :name

  def initialize(name, products=[], agile_method=nil)
    @name=name
    @products=products
    @agile_method=agile_method
  end

  def when_is_task_finished
    Date.today+30

  end

  def what_will_be_done_until
    %w{TP-123 TP-456}
  end

  def for_which_products_are_you_responsible
    productslist = []
    @products.each do |product|
      productslist << product.name
    end
    productslist
  end

  def who_is_the_product_owner_for (product_to_find)
    @products.each do |product|
      return product.product_owner if product.name == product_to_find
    end
  end

  def when_do_you_meet_for_standup
    Standup.new(10, 15, Standup::DAYS_IN_WEEK[0])
  end

  def who_is_member_of_the_team
    %w{Alexander\ Fürstenau Björn\ Schulz Larry\ Page Agata\ Catania Petra \Reski }
  end

  def whom_should_i_talk_to
    :anybody
  end

  def sprint_goal_accomplished
    @agile_method.sprint_goal_accomplished if @agile_method.respond_to?(:sprint_goal_accomplished)
  end

  def what_are_your_values
    %w{Respect Communication Feedback Courage}
  end

end