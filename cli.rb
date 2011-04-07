#!/usr/bin/env ruby -wKU
require 'readline'

class CLI
  # Select an option from a list of choices
  def self.choose(prompt, options)
    puts prompt
    options.each_with_index do |option, i|
      puts "#{i+1}. #{option}"
    end

    selection = nil
    while choice = Readline.readline('> ', true).strip.downcase do
      selection = nil

      # select number from list
      begin
        choice_number = Integer(choice) - 1
        selection = options[choice_number] if options[choice_number]
      rescue ArgumentError
      end

      # type item in list
      selection ||= options.detect { |option| option.to_s == choice }

      break if selection
    end
    selection
  end
end