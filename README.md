# sales-tax-ruby

## Install dependency gem

```
gem install rspec
```


## Run the project
move to root path (`cd project/path/sales-tax-ruby`) and run:
```
ruby ./lib/main.rb
```

## Set Input
Open `./lib/main.rb` file and set your own inputs.
```ruby
customInput = [
  '1 imported bottle of perfume at 27.99',
  '1 bottle of perfume at 18.99'
]

reader = Reader.new(input: customInput)
reader.output

```


## Run specs
move to root path (`cd project/path/sales-tax-ruby`) and run:
```
rspec .
```
