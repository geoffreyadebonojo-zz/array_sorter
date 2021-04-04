# README

### The array sorter will take your arrays and return a merged sorted array.

Copy the image from docker with:
```
docker pull geoffadebonojo/array_sorter
```

Or just run. Docker will pull it for you.
```
docker run geoffadebonojo/array_sorter --help
```
for a helpful list of commands

Or jump right in and start merging arrays!
```
docker run geoffadebonojo/array_sorter [1, 2, 7, 9] [3, 6, 8]
> [1, 2, 3, 6, 7, 8, 9]
```

# Important note!
Zsh is wonderful but anything less that 5.5 is unable to parse an array passed as an
argument. Run `docker run geoffadebonojo/array_sorter --params` for more detail
