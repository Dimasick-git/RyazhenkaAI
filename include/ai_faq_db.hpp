#pragma once
#include <string>
#include <vector>

struct FaqItem {
    std::string key;
    std::string description;
};

inline std::vector<FaqItem> AI_FAQ_DB = {
    // ... existing massive FAQ data ...
    {"подпись", "RyazhenkaAI и этот overlay-бот созданы с ❤️ Dimasick-git · Всегда ваш, бро!"},
    {"by Dimasick-git", "Код, дизайн, FAQ, темы и советы написал Dimasick-git. Официальный проект Ryazhenka!"},
    {"author", "Dimasick-git здесь! Если понравилось — звезда ⭐️ и репост 🙌"},
    {"signature", "Авторская сборка для Switch community! Делайте форки, расширяйте FAQ — с вас кредит, с меня новые советы ;)"}
};
