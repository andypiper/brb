# frozen_string_literal: true

require 'dream_cheeky'
require 'logger'

module Brb
  # Wrapper around DreamCheeky's BigRedButton with injectable callbacks.
  class Button
    def initialize(on_push: nil, on_open: nil, on_close: nil, logger: nil)
      @callbacks = {
        push: on_push,
        open: on_open,
        close: on_close
      }
      @logger = logger
    end

    def on_push(&block)
      @callbacks[:push] = block if block
    end

    def on_open(&block)
      @callbacks[:open] = block if block
    end

    def on_close(&block)
      @callbacks[:close] = block if block
    end

    def run
      DreamCheeky::BigRedButton.run do
        push { trigger(:push) }
        open { trigger(:open) }
        close { trigger(:close) }
      end
    end

    private

    def trigger(event)
      log("event=#{event}")
      callback = @callbacks[event]
      callback&.call
    end

    def log(message)
      return unless @logger

      if @logger.respond_to?(:info)
        @logger.info(message)
      else
        @logger.puts(message)
      end
    end
  end
end
