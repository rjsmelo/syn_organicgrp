<ul>
	{foreach $results as $result}
		<li>
			{$result.user|userlink}
		</li>
	{/foreach}
</ul>