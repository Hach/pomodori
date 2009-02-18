require File.dirname(__FILE__) + '/../test_helper'
require 'pomodori/submit_button'
require 'pomodori/frame'

class SubmitButtonTest < Test::Unit::TestCase
  
  def setup
    @submit_button = SubmitButton.new
  end
  
  def test_should_have_default_title
    assert_equal(@submit_button.title, "Submit")
  end
  
  def test_should_have_a_default_frame
    assert_equal(@submit_button.frame, Frame.new(0,0,96,32))
  end
  
  def test_should_render_as_cocoa
    @submit_button.expects(:button)
    @submit_button.render
  end
  
  def test_init_with_callback
    button = SubmitButton.new(:action => lambda { "yep" })
    assert_equal("yep", button.action.call)
  end
  
  def test_should_change_label
    @submit_button.label = "Void"
    assert_equal("Void", @submit_button.render.title)
  end
  
end