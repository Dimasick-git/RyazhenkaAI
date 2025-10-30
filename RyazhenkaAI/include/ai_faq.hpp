#pragma once
#include <string>
#include <vector>
#include "ai_faq_db.hpp"

namespace RyazhenkaAI {
std::vector<FaqItem> SearchFAQ(const std::string& query);
std::string BuildFAQResponse(const std::vector<FaqItem>& matches, const std::string& query);
}
