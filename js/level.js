let issues = 0
let storyPoints = 0

const labelContainer = document.getElementById("label-container")
const labelLevel = document.getElementById("label-level")

function resolveAndGo(link, issuesResolved, difficulty) {
    resolve(issuesResolved, difficulty)
    location.assign(link)
}

function resolve(issuesResolved, difficulty) {
    let lastLevel = getLevel(storyPoints)
    issues += issuesResolved
    storyPoints += difficulty

    let newLevel = getLevel(storyPoints)

    if (lastLevel < newLevel) {
        // level up
        labelLevel.className = 'show lvl-up';
        labelContainer.className = 'show header-inner'
        setTimeout(function () {
            labelLevel.className = 'hide lvl-up';
        }, 2000);
    }

    console.log("Total issues :" + issues + ", total storyPoints :" + storyPoints)

    labelContainer.innerHTML = "Level :" + getLevel(storyPoints) + " (issues :" + issues + ", points :" + storyPoints + ")"
    labelContainer.className = 'show header-inner';
}

// fib like...
const fibonacci = [1, 3, 5, 8, 13, 21, 34, 55]


function getLevel(points) {

    const nextValue = fibonacci.find(element => element > points)
    const index = fibonacci.indexOf(nextValue)
    if (index > 1) {
        return index - 1
    } else {
        return 0
    }
}
