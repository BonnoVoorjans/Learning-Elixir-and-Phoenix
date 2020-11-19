defmodule LiveViewStudio.LicenseCalculator do
    def calc(seats) do
        if seats <=3 do
            seats*20.0
        else
            60 + (seats - 3) * 15
        end
    end
end