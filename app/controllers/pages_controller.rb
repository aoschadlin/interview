class PagesController < ApplicationController
  def root
    @title = 'Home'
    @message1 = 'Job candidates get to show their abilities, rather than their interview skills.'
    @message2 = 'Recruiters get to see true talent and hire faster, more easily and with a higher accuracy.'
    @message3 = 'Get started today!'
  end
  
  def pricing
    @title = 'Pricing'
    @message1 = 'This service will always be free for candidates.'
    @message2 = 'Recruiters pay from $500/month depending on usage.'
  end
  
  def contact
    @title = 'Contact'
    @message = 'Email address and mailing address'
  end

end
