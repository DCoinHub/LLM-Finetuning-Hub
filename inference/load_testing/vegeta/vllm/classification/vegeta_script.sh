#!/bin/bash

dialogues=(
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: I was wondering if anyone out there could enlighten me on this car I saw the other day. It was a 2-door sports car, looked to be from the late 60s/ early 70s. It was called a Bricklin. The doors were really small. In addition, the front bumper was separate from the rest of the body. This is all I know. If anyone can tellme a model name, engine specs, years of production, where this car is made, history, or whatever info you have on this funky looking car, please e-mail. ### Class: "
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: I'm curious if someone could help me identify a unique vehicle I spotted recently. It appeared to be a compact electric car, with a futuristic design. The brand name was unfamiliar, and it had sleek, gull-wing doors. I'd love to learn more about its model, battery capacity, release date, manufacturer, and any intriguing history behind this distinctive car, so please drop me an email if you have any insights. ### Class: "
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: 'm seeking information about a vintage motorcycle I came across last week. It seemed to be a classic British cafe racer, possibly from the 1960s. The nameplate read "Norton." The bike had a distinctive slim frame and a dual-exhaust setup. If anyone has details about the specific model, engine specifications, production years, country of origin, or any anecdotes about Norton motorcycles, please reach out via email. ### Class: "
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: I'm inquisitive about a peculiar house I stumbled upon during a recent walk. It was an ultra-modern, minimalist structure with large, asymmetrical windows and a cantilevered design. I couldn't find any information on its architect or history. If you know anything about this architectural masterpiece, such as the architect's name, construction year, location, or any unique features, kindly send me an email. ### Class: "
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: I'm hoping someone can help me identify an intriguing piece of art I encountered at a local gallery. It was a surrealistic painting with vibrant colors and dreamlike imagery. The artist's signature was difficult to decipher. If you can provide insights into the artist's name, artistic style, the era in which it was created, or any interesting facts about this captivating artwork, please drop me an email. ### Class: "
    "Classify the following sentence that is delimited with triple backticks. ### Sentence: I'm on a quest to uncover information about a rare book I came across at an antique store. It was an old leather-bound tome with intricate embossing on the cover and gilt-edged pages. Unfortunately, there was no title or author listed, and the publication date was obscured. If you have knowledge about this mysterious book's title, authorship, publication date, genre, or any historical significance, please get in touch via email. ### Class: "
)

random_string=${dialogues[$RANDOM % ${#dialogues[@]}]}

echo "{
    \"model\": \"mariiaponom/llama_7b_class\",
    \"prompt\": \"$random_string\",
    \"max_tokens\": 20,
    \"temperature\": 0
}" > "$1"

./vegeta attack -duration=1s -rate=$2/1s -targets=target.list | ./vegeta report --type=text >> $3