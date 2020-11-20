defmodule LiveViewStudio.RandomNumbers do
    
    def generate_random_number(min, max) do
        Enum.random(min..max)
    end
end