require 'test/unit'
require 'date'
require_relative 'team'
require_relative 'product'

class TeamTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @cms_website = Product.new('CMS Website', 'Mathias North')
    @framework = Product.new('Framework', 'Alexander Soller')
    @landingpages = Product.new('Landingpages', 'Shannon Miller')
    @pre_reg_site = Product.new('PreRegSites', 'Mathias North')
    @products = [ @cms_website, @framework, @landingpages, @pre_reg_site]
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end


  def test_name

    team = Team.new('Black Team')
    assert_equal 'Black Team', team.name
  end

  def test_when_finished
    team = Team.new('Black Team')
    assert_equal(Date.today + 30, team.when_is_task_finished)
  end

  def test_what_will_be_finished
    team = Team.new('Black Team')
    assert_equal(%w{TP-123 TP-456}, team.what_will_be_done_until)
  end

  def test_for_which_products_are_you_responsible


    team = Team.new('Black Team', @products)
    assert_equal(%w{CMS\ Website Framework Landingpages PreRegSites}, team.for_which_products_are_you_responsible)
  end

  def test_who_is_the_product_owner_for


    team = Team.new('Black Team', @products)

    assert_equal('Alexander Soller', team.who_is_the_product_owner_for('Framework'))
    assert_equal('Mathias North', team.who_is_the_product_owner_for('CMS Website'))
  end

  def test_when_do_you_meet_for_standup
    team = Team.new('Black Team')
    assert_equal(10, team.when_do_you_meet_for_standup.hour)
    assert_equal(15, team.when_do_you_meet_for_standup.minute)
    assert_equal(Standup::DAYS_IN_WEEK[0], team.when_do_you_meet_for_standup.days_in_week)
  end

  def test_team_members
    team = Team.new('Black Team')
    assert_true(team.who_is_member_of_the_team.include?('Alexander Fürstenau'))
  end

  def test_the_person_to_talk_to
    team = Team.new('Black Team')
    assert_equal(:anybody, team.whom_should_i_talk_to)
  end

  def test_sprint_goal_accomplished
    team = Team.new('Black Team')
    assert_equal(nil, team.sprint_goal_accomplished)

  end

  def test_what_are_your_values
    team = Team.new('Black Team')
    assert_equal(%w{Respect Communication Feedback Courage}, team.what_are_your_values)

  end

end