<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<li class="page-item">
    <a class="page-link" href="./pmdList?page=${pager.startNum-1}" aria-label="Previous">
        <span aria-hidden="true">
            <i class="fas fa-chevron-left"></i>
        </span>
    </a>
</li>
<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
    <li class="page-item">
         <a class="page-link" href="./pmdList?page=${i}">${i}</a>
    </li>
</c:forEach>
<li class="page-item">
    <a class="page-link" href="./pmdList?page=${pager.lastNum+1}" aria-label="Next">
        <span aria-hidden="true">
            <i class="fas fa-chevron-right"></i>
        </span>
    </a>
</li>