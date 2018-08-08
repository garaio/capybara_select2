require 'spec_helper'

require 'spec_helper'

describe CapybaraSelect2 do

  shared_context 'with select2 version 4' do |options = {}|

    before { visit 'select2-v4/index.html' }

    driver = options[:driver]
    context "with a JS driver: #{driver}", driver: driver do

      context 'selecting a value from a single select box' do

        it 'identified by XPath' do
          select2 'XBox', xpath: "//div[@id='single']"
          expect(page).to have_css '.select2-container span', text: 'XBox'
        end

        it 'identified by CSS selector' do
          select2 'XBox', css: '#single .select2-container'
          expect(page).to have_css '.select2-container span', text: 'XBox'
        end

      end

      context 'selecting a value from a multi select box' do

        it 'identified by XPath' do
          select2 'Buy Milk', xpath: "//div[@id='multiple']"
          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

        it 'identified by CSS selector' do
          select2 'Buy Milk', css: '#multiple .select2-container'
          expect(page).to have_css '.select2-selection__choice', text: 'Buy Milk'
        end

      end

    end
  end

  include_context 'with select2 version 4', driver: :selenium
  include_context 'with select2 version 4', driver: :webkit

end