
-- A global variable for the Hyper Mode
k = hs.hotkey.modal.new({}, "F17")

-- The following keys are configured as hot keys in their respective apps (or in Keyboard Maestro)
-- w → Divvy (configure in Divvy preferences)
-- d → Dash (configure in BTT preferences)
-- c → Fantastical mini window (configure in Fantastical preferences)
-- t → iTerm (configure in BTT preferences)
-- k → Skitch Crosshair Screenshot (configure in BTT preferences)
-- e → Evernote (configure in BTT preferences)
-- b → Bartender (configure in Bartender preferences)
-- v → Clean paste

hyperBindings = {'w','d','c','t','k','e','b','v'}

for i,key in ipairs(hyperBindings) do
  k:bind({}, key, nil, function() hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, key)
    k.triggered = true
  end)
end

-- Shortcut to reload config
ofun = function()
  hs.reload()
  hs.alert.show("Config loaded")
  k.triggered = true
end
k:bind({}, 'o', nil, ofun)

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
pressedF18 = function()
  k.triggered = false
  k:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
--   send ESCAPE if no other keys are pressed.
releasedF18 = function()
k:exit()
  if not k.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
