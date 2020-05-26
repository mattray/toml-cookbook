# toml_file

Provides custom resource for creating TOML files by passing a hash as the `content`. The `toml_file` resource extends the `file` resource, so it has all of the other properties.

```
a = {
    'golf': 'hotel',
    'kilo': ['lima', 'mike', 'november'],
    'india': {
        'juliett': true
        },
    'alpha': {
        'charlie': 'delta',
        'bravo': 10,
        },
    'echo': 'foxtrot'
    }

toml_file '/tmp/file.toml' do
    content a
end
```

produces the file `/tmp/file.toml`
```
echo = "foxtrot"
golf = "hotel"
kilo = ["lima", "mike", "november"]
[alpha]
bravo = 10
charlie = "delta"
[india]
juliett = true
```
