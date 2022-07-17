local status_ok, fox = pcall(require, "nightfox")
if not status_ok then
    return
end

fox.setup({
    options = {
        transpaent = false;
        dim_inactive = false;
        styles = {
            comments = "italic",
            -- keywords = "underline",
            -- types = "italic, underline",
        }
    }
})
