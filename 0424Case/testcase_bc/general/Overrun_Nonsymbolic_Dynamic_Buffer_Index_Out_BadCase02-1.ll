; ModuleID = '/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/testcase_bc/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase02-1.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase02-1.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad02(i32 noundef %n) #0 !dbg !11 {
entry:
  %n.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %y = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.declare(metadata i8** %p, metadata !19, metadata !DIExpression()), !dbg !22
  %0 = load i32, i32* %n.addr, align 4, !dbg !23
  %conv = sext i32 %0 to i64, !dbg !23
  %call = call i8* @malloc(i64 noundef %conv) #4, !dbg !24
  store i8* %call, i8** %p, align 8, !dbg !22
  %1 = load i8*, i8** %p, align 8, !dbg !25
  %cmp = icmp eq i8* %1, null, !dbg !27
  br i1 %cmp, label %if.then, label %if.end, !dbg !28

if.then:                                          ; preds = %entry
  br label %return, !dbg !29

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %y, metadata !31, metadata !DIExpression()), !dbg !32
  %2 = load i32, i32* %n.addr, align 4, !dbg !33
  store i32 %2, i32* %y, align 4, !dbg !32
  %3 = load i8*, i8** %p, align 8, !dbg !34
  %4 = load i32, i32* %y, align 4, !dbg !35
  %idxprom = sext i32 %4 to i64, !dbg !34
  %arrayidx = getelementptr inbounds i8, i8* %3, i64 %idxprom, !dbg !34
  store i8 97, i8* %arrayidx, align 1, !dbg !36
  %5 = load i8*, i8** %p, align 8, !dbg !37
  call void @free(i8* noundef %5), !dbg !38
  br label %return, !dbg !39

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !39
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare void @free(i8* noundef) #3

; Function Attrs: noinline nounwind optnone ssp uwtable
define i32 @main() #0 !dbg !40 {
entry:
  call void @TestCaseBad02(i32 noundef 5), !dbg !43
  ret i32 0, !dbg !44
}

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case/general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "TestCaseBad02", scope: !12, file: !12, line: 11, type: !13, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!12 = !DIFile(filename: "general/Overrun_Nonsymbolic_Dynamic_Buffer_Index_Out_BadCase02-1.c", directory: "/Users/jiaweiwang/CLionProjects/SSE-TestCases/0424Case")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "n", arg: 1, scope: !11, file: !12, line: 11, type: !15)
!18 = !DILocation(line: 11, column: 24, scope: !11)
!19 = !DILocalVariable(name: "p", scope: !11, file: !12, line: 13, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!21 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!22 = !DILocation(line: 13, column: 11, scope: !11)
!23 = !DILocation(line: 13, column: 22, scope: !11)
!24 = !DILocation(line: 13, column: 15, scope: !11)
!25 = !DILocation(line: 14, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !11, file: !12, line: 14, column: 9)
!27 = !DILocation(line: 14, column: 11, scope: !26)
!28 = !DILocation(line: 14, column: 9, scope: !11)
!29 = !DILocation(line: 15, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !26, file: !12, line: 14, column: 20)
!31 = !DILocalVariable(name: "y", scope: !11, file: !12, line: 17, type: !15)
!32 = !DILocation(line: 17, column: 9, scope: !11)
!33 = !DILocation(line: 17, column: 13, scope: !11)
!34 = !DILocation(line: 19, column: 5, scope: !11)
!35 = !DILocation(line: 19, column: 7, scope: !11)
!36 = !DILocation(line: 19, column: 10, scope: !11)
!37 = !DILocation(line: 21, column: 10, scope: !11)
!38 = !DILocation(line: 21, column: 5, scope: !11)
!39 = !DILocation(line: 22, column: 1, scope: !11)
!40 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 24, type: !41, scopeLine: 24, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!41 = !DISubroutineType(types: !42)
!42 = !{!15}
!43 = !DILocation(line: 25, column: 5, scope: !40)
!44 = !DILocation(line: 26, column: 1, scope: !40)
