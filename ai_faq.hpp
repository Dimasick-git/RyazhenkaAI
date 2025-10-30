#pragma once
#include <string>
#include <vector>
#include "ai_faq_db.hpp"

namespace RyazhenkaAI {

// Возвращает список всех FAQ по частичному совпадению с запросом
std::vector<FaqItem> SearchFAQ(const std::string& query);

// Формирует красивый ответ для интерфейса Overlay
std::string BuildFAQResponse(const std::vector<FaqItem>& matches, const std::string& query);

} // namespace RyazhenkaAI
