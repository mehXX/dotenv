import { KarabinerRules } from "../../types";

export const NotesBackForth: KarabinerRules =
    {
        description: "Change language while openning goland/iterm",
        manipulators: [
            {
                description: "new tab terminal goland",
                from: {
                    key_code: "open_bracket",
                    modifiers: {
                        mandatory: ["left_command"]
                    }
                },
                to: [
                    {
                        key_code: "open_bracket",
                        modifiers: ["left_option", "left_command"]
                    },
                ],
                type: "basic",
                conditions: [
                    {
                        type: "frontmost_application_if",
                        bundle_identifiers: [
                            "^com.apple.Notes$"
                        ]
                    }
                ]
            },
            {
                description: "new tab terminal goland",
                from: {
                    key_code: "close_bracket",
                    modifiers: {
                        mandatory: ["left_command"]
                    }
                },
                to: [
                    {
                        key_code: "close_bracket",
                        modifiers: ["left_option", "left_command"]
                    },
                ],
                type: "basic",
                conditions: [
                    {
                        type: "frontmost_application_if",
                        bundle_identifiers: [
                            "^com.apple.Notes$"
                        ]
                    }
                ]
            },
        ]
    };
