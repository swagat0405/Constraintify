# Constraintify

This library makes adding contraints to a view easy and readable. Ditch the confusing old formats with a cleaner syntax.

## Native API

```
let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
  label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12.0),
  label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12.0),
  label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
  label.heightAnchor.constraint(equalToConstant: 50.0)
])
```

## Constraintify

```
let label = UILabel()

// Skip the `translatesAutoresizingMaskIntoConstraints` for any new view.
// `anchor` function returns `[NSLayoutConstraint]` for any addtional manipulation if needed.
NSLayoutConstraint.activate(
    userIdlabel.anchor(
        leading: view.leadingAnchor,
        top: view.topAnchor,
        trailing: view.trailingAnchor,
        leadingConstant: 12.0,
        topConstant: 50.0,
        trailingConstant: 12.0,
        heightConstant: 50.0
    )
)
```
