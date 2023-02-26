; ModuleID = 'linux_bc/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @main() #0 !dbg !13 {
entry:
  %n = alloca i32, align 4
  %ret = alloca i32, align 4
  %p = alloca i8*, align 8
  %y = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %n, metadata !17, metadata !DIExpression()), !dbg !19
  call void @llvm.dbg.declare(metadata i32* %ret, metadata !20, metadata !DIExpression()), !dbg !21
  %call = call i32 (i8*, ...) @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* %n), !dbg !22
  store i32 %call, i32* %ret, align 4, !dbg !21
  call void @llvm.dbg.declare(metadata i8** %p, metadata !23, metadata !DIExpression()), !dbg !24
  %0 = load i32, i32* %n, align 4, !dbg !25
  %conv = sext i32 %0 to i64, !dbg !25
  %1 = alloca i8, i64 %conv, align 16, !dbg !25
  store i8* %1, i8** %p, align 8, !dbg !24
  call void @llvm.dbg.declare(metadata i32* %y, metadata !26, metadata !DIExpression()), !dbg !27
  %2 = load i32, i32* %n, align 4, !dbg !28
  store i32 %2, i32* %y, align 4, !dbg !27
  %3 = load i8*, i8** %p, align 8, !dbg !29
  %cmp = icmp eq i8* %3, null, !dbg !31
  br i1 %cmp, label %if.then, label %if.end, !dbg !32

if.then:                                          ; preds = %entry
  br label %return, !dbg !33

if.end:                                           ; preds = %entry
  %4 = load i8*, i8** %p, align 8, !dbg !35
  %5 = load i32, i32* %y, align 4, !dbg !36
  %idxprom = sext i32 %5 to i64, !dbg !35
  %arrayidx = getelementptr inbounds i8, i8* %4, i64 %idxprom, !dbg !35
  store i8 97, i8* %arrayidx, align 1, !dbg !37
  %6 = load i8*, i8** %p, align 8, !dbg !38
  call void @free(i8* %6) #4, !dbg !39
  br label %return, !dbg !40

return:                                           ; preds = %if.end, %if.then
  ret void, !dbg !40
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @__isoc99_scanf(i8*, ...) #2

; Function Attrs: nounwind
declare dso_local void @free(i8*) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{}
!3 = !{!4, !6}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{i32 7, !"frame-pointer", i32 2}
!12 = !{!"clang version 13.0.0"}
!13 = distinct !DISubprogram(name: "main", scope: !14, file: !14, line: 28, type: !15, scopeLine: 29, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!14 = !DIFile(filename: "src/overflow_pass/BUF_OVERFLOW_Overrun_ArrayIndex_Overflow_BadCase02-1.c", directory: "/home/SVF-tools/SSE-TestCases")
!15 = !DISubroutineType(types: !16)
!16 = !{null}
!17 = !DILocalVariable(name: "n", scope: !13, file: !14, line: 30, type: !18)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DILocation(line: 30, column: 9, scope: !13)
!20 = !DILocalVariable(name: "ret", scope: !13, file: !14, line: 31, type: !18)
!21 = !DILocation(line: 31, column: 9, scope: !13)
!22 = !DILocation(line: 31, column: 15, scope: !13)
!23 = !DILocalVariable(name: "p", scope: !13, file: !14, line: 32, type: !4)
!24 = !DILocation(line: 32, column: 11, scope: !13)
!25 = !DILocation(line: 32, column: 23, scope: !13)
!26 = !DILocalVariable(name: "y", scope: !13, file: !14, line: 33, type: !18)
!27 = !DILocation(line: 33, column: 9, scope: !13)
!28 = !DILocation(line: 33, column: 13, scope: !13)
!29 = !DILocation(line: 34, column: 9, scope: !30)
!30 = distinct !DILexicalBlock(scope: !13, file: !14, line: 34, column: 9)
!31 = !DILocation(line: 34, column: 11, scope: !30)
!32 = !DILocation(line: 34, column: 9, scope: !13)
!33 = !DILocation(line: 35, column: 9, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !14, line: 34, column: 20)
!35 = !DILocation(line: 38, column: 5, scope: !13)
!36 = !DILocation(line: 38, column: 7, scope: !13)
!37 = !DILocation(line: 38, column: 10, scope: !13)
!38 = !DILocation(line: 39, column: 10, scope: !13)
!39 = !DILocation(line: 39, column: 5, scope: !13)
!40 = !DILocation(line: 40, column: 1, scope: !13)
