# Application specific things that can't live in a dotfile location

## Moom

`Moom.plist` is a basic set of Moom settings.

### Import settings file

`defaults import com.manytricks.Moom Moom.plist`

### Update settings file

`defaults export com.manytricks.Moom Moom.plist`

## Nova.app

### Import settings file

`defaults import com.panic.Nova appsync/nova-settings.plist`

### Update settings file

`defaults export com.panic.Nova appsync/nova-settings.plist`

### Import keybindings file

- Go to `Settings > Keybindings`
- Open the `Key Bindings Set` dropdown and click `Manage Key Bindings...`
- Click the kebab menu at the bottom and click "Import Key Bindings..."
- Choose `nova-keybindings.json` and click `Done`
- Set the `Key Bindings Set` to `nova-keybindings`

### Update keybindings file

- Go to `Settings > Keybindings`
- Ensure that `Key Bindings Set` is set to `nova-keybindings`
- Open the `Key Bindings Set` dropdown and click `Manage Key Bindings...`
- Click the kebab menu at the bottom and click "Export Key Bindings..."
- Choose `nova-keybindings.json` to overwrite and click `Done`

### Manually sync extensions and extension settings

Copy + paste `~/Library/Application Support/Nova/Extensions`

### More info

[Nova Settings Info](https://help.nova.app/faqs/moving-data/#settings-extensions-and-clips)
