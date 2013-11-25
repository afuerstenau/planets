require_relative ('standup')

class Team

  attr_reader :name

  def initialize(name, products=[], agile_method=nil)
    @name=name
    @products=products
    @agile_method=agile_method
  end

=begin
  I want an anwer to this question from the team (more likely the PO) now
  ( A look in the backlog is allowed). I know it will be an estimate but I don't
  want to wait several hours or even days to get the "most accurate" answer.
=end
  def when_is_task_finished
    Date.today+30

  end

=begin
  I want an answer to this question immediately (Again, a glimpse in the backlog is ok).
  I don't want to paralyse the team with a several hours meeting.
  It is ok if someone tells me how to calculate it like "During the last weeks we accomplished 3 Backlog items per week on average."
  With this answer and the transparent backlog (and it must be transparent) I can calculate it myself.
=end
  def what_will_be_done_until
    %w{TP-123 TP-456}
  end

  # Only if you have the same problem like we have that a team is responsible for more than one product
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

  # When is the best time to get in contact with the team?
  def when_do_you_meet_for_standup
    Standup.new(10, 15, Standup::DAYS_IN_WEEK[0])
  end

  def who_is_member_of_the_team
    %w{Alexander\ Fürstenau Björn\ Schulz Larry\ Page Agata\ Catania Petra \Reski }
  end


  # Who is the right person of the team to talk to if I don't have a concrete contact person?
  def whom_should_i_talk_to
    :anybody
  end


  # Is this relevant for someone outside the team or should these informations for someone outside the team?
  def what_are_your_values
    %w{Respect Communication Feedback Courage}
  end

  # Here begins the private part - the part of questions which is relevant only for the team
  private

# Did we manage to accomplish the sprint goal? Why or why not?
  def sprint_goal_accomplished
    @agile_method.sprint_goal_accomplished if @agile_method.respond_to?(:sprint_goal_accomplished)
  end

end