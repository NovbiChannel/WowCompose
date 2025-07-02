print("Modifier.lua loaded")

---@class Modifier
Modifier = {
    id = nil,
    width = nil,
    height = nil,
    padding = Padding(0, 0, 0, 0),
    background = nil,
    movable = false,
    anchor = Anchor(Alignment.TopStart, 0, 0)
}

function Modifier:new()
    local modifier = setmetatable({}, { __index = Modifier })
    modifier.id = nil
    modifier.width = nil
    modifier.height = nil
    modifier.padding = Padding(0, 0, 0, 0)
    modifier.background = nil
    modifier.movable = false
    modifier.anchor = Anchor(Alignment.TopStart, 0, 0)
    return modifier
end

---@param id string
function Modifier:setId(id)
    self.id = id
    return self
end

---@param height integer
function Modifier:setHeight(height)
    self.height = height
    return self
end

---@param width integer
function Modifier:setWidth(width)
    self.width = width
    return self
end

---@param size integer
function Modifier:setSize(size)
    self.width = size
    self.height = size
    return self
end

---@param parent UIParent
function Modifier:fillMaxWidth(parent)
    local parentWidth = parent:GetWidth()
    local currentWidth = parentWidth - (self.padding.left + self.padding.right)
    self.width = currentWidth
    return self
end

---@param parent UIParent
function Modifier:fillMaxHeight(parent)
    local parentHeight = parent:GetHeight()
    local currentHeight = parentHeight - (self.padding.top + self.padding.bottom)
    self.height = currentHeight
    return self
end

---@param parent UIParent
function Modifier:fillMaxSize(parent)
    local parentHeight = parent:GetHeight()
    local parentWidth = parent:GetWidth()
    local currentHeight = parentHeight - (self.padding.top + self.padding.bottom)
    local currentWidth = parentWidth - (self.padding.left + self.padding.right)
    self.width = currentWidth
    self.height = currentHeight
    return self
end

function Modifier:wrapContent()
    self.wrapContent = true
    return self
end

---@param start integer
---@param top integer
---@param _end integer
---@param bottom integer
function Modifier:setPadding(start, top, _end, bottom)
    self.padding = Padding(start, top, _end, bottom)
    return self
end

---@param all integer
function Modifier:setAllPadding(all)
    self.padding = Padding(all, all, all, all)
    return self
end

---@param horizontal integer
function Modifier:setPaddingHorizontal(horizontal)
    self.padding = Padding(horizontal, self.padding.top, horizontal, self.padding.bottom)
    return self
end

---@param vertical integer
function Modifier:setPaddingVertical(vertical)
    self.padding = Padding(self.padding.left, vertical, self.padding.right, vertical)
    return self
end

---@param alignment Alignment
---@param x? integer
---@param y? integer
function Modifier:setAnchor(alignment, x, y)
    self.anchor = Anchor(alignment, x or 0, y or 0)
    return self
end

function Modifier:setMovable()
    self.movable = true
    return self
end

---@param textures table
---@param borderSize integer
function Modifier:setBackground(textures, borderSize)
    local padding
    
    if borderSize == BorderSize.Large then
        padding = Padding(8, 8, 8, 8)
    elseif borderSize == BorderSize.Medium then
        padding = Padding(4, 4, 4, 4)
    elseif borderSize == BorderSize.Small then
        padding = Padding(2, 2, 2, 2)
    else
        padding = Padding(0, 0, 0, 0)
    end
    
    self.background = BackDrop(textures, true, borderSize, borderSize, padding)
    return self
end