# frozen_string_literal: true

class WordSynth
  def initialize
    @effects = []
  end

  def add_effect(effect)
    @effects << effect
  end

  def play(original_words)
    # words = original_words
    # @effects.each do |effect|
    #   words = effect.call(words)
    # end
    # words

    # injectを使って書いた場合
    @effects.inject(original_words) { |words, effect| effect.call(words) }
  end
end
