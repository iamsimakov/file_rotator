# File Rotator

## Usage

Rotate any files even comon files, no log files.
Sometimes we need save previous version of file and write current version to constant certain file name.
Example.
We have `nginx.conf`.
Regenerate it. We want to save new file to `nginx.conf` with saving content of previous version `nginx.conf`.
We do `mv nginx.conf nginx.conf.1`.
And then write new content to `nginx.conf`
But what about if these files more than one?
Just do it comfortable with File Rotator! )

## Getting Started

1. Install gem:

        $ gem install file_rotator

or for IRB

        > require 'file_rotator'

2. And use it:

        > FileRotator.new(original, count_files).run

where
`original` - name of rotating file
`count_files` - count of saving files, default = 10



## Contributing

Be free for it! Welcome!

## Code Status

I think it is nearly RC.

## License

File Rotator is released under the [MIT License](https://opensource.org/licenses/MIT).
