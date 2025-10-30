#include "../include/ai_faq.hpp"
#include <algorithm>
#include <cctype>

namespace RyazhenkaAI {
static bool containsCaseInsensitive(const std::string& hay, const std::string& needle) {
    auto it = std::search(
        hay.begin(), hay.end(),
        needle.begin(), needle.end(),
        [](char ch1, char ch2) { return std::tolower(ch1) == std::tolower(ch2); });
    return it != hay.end();
}
std::vector<FaqItem> SearchFAQ(const std::string& query) {
    std::vector<FaqItem> out;
    if (query.empty()) return out;
    for (const auto& faq : AI_FAQ_DB) {
        if (containsCaseInsensitive(faq.key, query) || containsCaseInsensitive(faq.description, query)) {
            out.push_back(faq);
        }
    }
    return out;
}
std::string BuildFAQResponse(const std::vector<FaqItem>& matches, const std::string& query) {
    if (matches.empty()) return "[AI]: Не найдено информации по запросу: '" + query + "'. Попробуй изменить формулировку.";
    std::string resp = "[AI]: По вашему запросу найдено " + std::to_string(matches.size()) + " вариант(а):\n";
    for (const auto& m : matches) {
        resp += "\n\u25B6 ";
        resp += m.key + ": " + m.description + "\n";
    }
    return resp;
}
}
