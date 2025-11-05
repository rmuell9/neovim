return {
    'rmuell9/jarvis.nvim',
    dependencies = { 'nvim-lua/plenary.nvim'},
    config = function()
        local system_prompt =
        'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks. Indent after 80 characters.'
        local helpful_prompt = 'You are a helpful assistant who is always concise and makes no mistakes. What I have sent are my notes so far. If a line you wrote it over 80 characters, indent to a new line.'
        local jarvis = require 'jarvis'


        local function handle_open_router_spec_data(data_stream)
            local success, json = pcall(vim.json.decode, data_stream)
            if success then
                if json.choices and json.choices[1] and json.choices[1].text then
                    local content = json.choices[1].text
                    if content then
                        jarvis.write_string_at_cursor(content)
                    end
                end
            else
                print("non json " .. data_stream)
            end
        end

        local function custom_make_openai_spec_curl_args(opts, prompt)
            local url = opts.url
            local api_key = opts.api_key_name and os.getenv(opts.api_key_name)
            local data = {
                prompt = prompt,
                model = opts.model,
                temperature = 0.7,
                stream = true,
            }
            local args = { '-N', '-X', 'POST', '-H', 'Content-Type: application/json', '-d', vim.json.encode(data) }
            if api_key then
                table.insert(args, '-H')
                table.insert(args, 'Authorization: Bearer ' .. api_key)
            end
            table.insert(args, url)
            return args
        end

        local function anthropic_help()
            jarvis.invoke_llm_and_stream_into_editor({
                url = 'https://api.anthropic.com/v1/messages',
                model = 'claude-sonnet-4-20250514',
                api_key_name = 'ANTHROPIC_API_KEY',
                system_prompt = helpful_prompt,
                replace = false,
            }, jarvis.make_anthropic_spec_curl_args, jarvis.handle_anthropic_spec_data)
        end

        local function anthropic_replace()
            jarvis.invoke_llm_and_stream_into_editor({
                url = 'https://api.anthropic.com/v1/messages',
                model = 'claude-opus-4-20250514',
                api_key_name = 'ANTHROPIC_API_KEY',
                system_prompt = system_prompt,
                replace = true,
            }, jarvis.make_anthropic_spec_curl_args, jarvis.handle_anthropic_spec_data)
        end

        vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_help, { desc = 'llm anthropic_help' })
        vim.keymap.set({ 'n', 'v' }, '<leader>I', anthropic_replace, { desc = 'llm anthropic' })
    end
}
