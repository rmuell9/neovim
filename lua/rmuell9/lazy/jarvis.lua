
return {
    'rmuell9/jarvis.nvim',

    dependencies = { 'nvim-lua/plenary.nvim'},

    config = function()
        local system_prompt =
        'You should replace the code that you are sent, only following the comments. Do not talk at all. Only output valid code. Do not provide any backticks that surround the code. Never ever output backticks like this ```. Any comment that is asking you for something should be removed after you satisfy them. Other comments should left alone. Do not output backticks. Indent after 80 characters.'

        local helpful_prompt = 'You are a helpful assistant who is always concise and makes no mistakes. What I have sent are my notes so far. If a line you wrote it over 80 characters, indent to a new line.'

        local jarvis = require 'jarvis'

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

        local function openai_help()
            jarvis.invoke_llm_and_stream_into_editor({
                url = 'https://api.openai.com/v1/chat/completions',
                model = 'gpt-5',
                api_key_name = 'OPENAI_API_KEY',
                system_prompt = helpful_prompt,
                replace = false,
            }, jarvis.make_openai_spec_curl_args, jarvis.handle_openai_spec_data)
        end

        local function openai_replace()
            jarvis.invoke_llm_and_stream_into_editor({
                url = 'https://api.openai.com/v1/chat/completions',
                model = 'gpt-5',
                api_key_name = 'OPENAI_API_KEY',
                system_prompt = system_prompt,
                replace = true,
            }, jarvis.make_openai_spec_curl_args, jarvis.handle_openai_spec_data)
        end

        vim.keymap.set({ 'n', 'v' }, '<leader>i', anthropic_help, { desc = 'llm anthropic_help' })
        vim.keymap.set({ 'n', 'v' }, '<leader>I', anthropic_replace, { desc = 'llm anthropic' })
        vim.keymap.set({ 'n', 'v' }, '<leader>g', openai_help, { desc = 'llm openai_help' })
        vim.keymap.set({ 'n', 'v' }, '<leader>G', openai_replace, { desc = 'llm openai_replace' })

    end
}
