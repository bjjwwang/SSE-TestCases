; ModuleID = '/Users/jiaweiwang/CLionProjects/0419Case/testcase_bc/general/Overrun_Loop_Bound_Buffer_Index_Out_BadCase01.ll'
source_filename = "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Loop_Bound_Buffer_Index_Out_BadCase01.c"
target datalayout = "e-m:o-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx12.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @TestCaseBad01(i32 noundef %n) #0 !dbg !11 {
entry:
  %n.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %n.addr, metadata !17, metadata !DIExpression()), !dbg !18
  %0 = load i32, i32* %n.addr, align 4, !dbg !19
  %cmp = icmp slt i32 %0, 1, !dbg !21
  br i1 %cmp, label %if.then, label %if.end, !dbg !22

if.then:                                          ; preds = %entry
  br label %return, !dbg !23

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i8** %p, metadata !25, metadata !DIExpression()), !dbg !28
  %1 = load i32, i32* %n.addr, align 4, !dbg !29
  %conv = sext i32 %1 to i64, !dbg !29
  %call = call i8* @malloc(i64 noundef %conv) #4, !dbg !30
  store i8* %call, i8** %p, align 8, !dbg !28
  %2 = load i8*, i8** %p, align 8, !dbg !31
  %cmp1 = icmp eq i8* %2, null, !dbg !33
  br i1 %cmp1, label %if.then3, label %if.end4, !dbg !34

if.then3:                                         ; preds = %if.end
  br label %return, !dbg !35

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata i32* %i, metadata !37, metadata !DIExpression()), !dbg !38
  store i32 0, i32* %i, align 4, !dbg !38
  br label %for.cond, !dbg !39

for.cond:                                         ; preds = %for.inc, %if.end4
  %3 = load i32, i32* %i, align 4, !dbg !40
  %4 = load i32, i32* %n.addr, align 4, !dbg !43
  %cmp5 = icmp slt i32 %3, %4, !dbg !44
  br i1 %cmp5, label %for.body, label %for.end, !dbg !45

for.body:                                         ; preds = %for.cond
  %5 = load i8*, i8** %p, align 8, !dbg !46
  %6 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %6 to i64, !dbg !46
  %arrayidx = getelementptr inbounds i8, i8* %5, i64 %idxprom, !dbg !46
  store i8 1, i8* %arrayidx, align 1, !dbg !49
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %for.body
  %7 = load i32, i32* %i, align 4, !dbg !51
  %inc = add nsw i32 %7, 1, !dbg !51
  store i32 %inc, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %8 = load i8*, i8** %p, align 8, !dbg !56
  %9 = load i32, i32* %i, align 4, !dbg !57
  %idxprom7 = sext i32 %9 to i64, !dbg !56
  %arrayidx8 = getelementptr inbounds i8, i8* %8, i64 %idxprom7, !dbg !56
  store i8 1, i8* %arrayidx8, align 1, !dbg !58
  %10 = load i8*, i8** %p, align 8, !dbg !59
  call void @free(i8* noundef %10), !dbg !60
  br label %return, !dbg !61

return:                                           ; preds = %for.end, %if.then3, %if.then
  ret void, !dbg !61
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: allocsize(0)
declare i8* @malloc(i64 noundef) #2

declare void @free(i8* noundef) #3

attributes #0 = { noinline nounwind optnone ssp uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "tune-cpu"="generic" }
attributes #4 = { allocsize(0) }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!4, !5, !6, !7, !8, !9}
!llvm.ident = !{!10}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "Homebrew clang version 14.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !2, splitDebugInlining: false, nameTableKind: None, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!1 = !DIFile(filename: "/Users/jiaweiwang/CLionProjects/0419Case/general/Overrun_Loop_Bound_Buffer_Index_Out_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!2 = !{!3}
!3 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!4 = !{i32 7, !"Dwarf Version", i32 4}
!5 = !{i32 2, !"Debug Info Version", i32 3}
!6 = !{i32 1, !"wchar_size", i32 4}
!7 = !{i32 7, !"PIC Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 1}
!9 = !{i32 7, !"frame-pointer", i32 2}
!10 = !{!"Homebrew clang version 14.0.6"}
!11 = distinct !DISubprogram(name: "TestCaseBad01", scope: !12, file: !12, line: 13, type: !13, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !16)
!12 = !DIFile(filename: "general/Overrun_Loop_Bound_Buffer_Index_Out_BadCase01.c", directory: "/Users/jiaweiwang/CLionProjects/0419Case")
!13 = !DISubroutineType(types: !14)
!14 = !{null, !15}
!15 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!16 = !{}
!17 = !DILocalVariable(name: "n", arg: 1, scope: !11, file: !12, line: 13, type: !15)
!18 = !DILocation(line: 13, column: 24, scope: !11)
!19 = !DILocation(line: 15, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !11, file: !12, line: 15, column: 9)
!21 = !DILocation(line: 15, column: 11, scope: !20)
!22 = !DILocation(line: 15, column: 9, scope: !11)
!23 = !DILocation(line: 16, column: 9, scope: !24)
!24 = distinct !DILexicalBlock(scope: !20, file: !12, line: 15, column: 16)
!25 = !DILocalVariable(name: "p", scope: !11, file: !12, line: 19, type: !26)
!26 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!27 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!28 = !DILocation(line: 19, column: 11, scope: !11)
!29 = !DILocation(line: 19, column: 22, scope: !11)
!30 = !DILocation(line: 19, column: 15, scope: !11)
!31 = !DILocation(line: 20, column: 9, scope: !32)
!32 = distinct !DILexicalBlock(scope: !11, file: !12, line: 20, column: 9)
!33 = !DILocation(line: 20, column: 11, scope: !32)
!34 = !DILocation(line: 20, column: 9, scope: !11)
!35 = !DILocation(line: 21, column: 9, scope: !36)
!36 = distinct !DILexicalBlock(scope: !32, file: !12, line: 20, column: 20)
!37 = !DILocalVariable(name: "i", scope: !11, file: !12, line: 24, type: !15)
!38 = !DILocation(line: 24, column: 9, scope: !11)
!39 = !DILocation(line: 25, column: 5, scope: !11)
!40 = !DILocation(line: 25, column: 12, scope: !41)
!41 = distinct !DILexicalBlock(scope: !42, file: !12, line: 25, column: 5)
!42 = distinct !DILexicalBlock(scope: !11, file: !12, line: 25, column: 5)
!43 = !DILocation(line: 25, column: 16, scope: !41)
!44 = !DILocation(line: 25, column: 14, scope: !41)
!45 = !DILocation(line: 25, column: 5, scope: !42)
!46 = !DILocation(line: 26, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !41, file: !12, line: 25, column: 24)
!48 = !DILocation(line: 26, column: 11, scope: !47)
!49 = !DILocation(line: 26, column: 14, scope: !47)
!50 = !DILocation(line: 27, column: 5, scope: !47)
!51 = !DILocation(line: 25, column: 20, scope: !41)
!52 = !DILocation(line: 25, column: 5, scope: !41)
!53 = distinct !{!53, !45, !54, !55}
!54 = !DILocation(line: 27, column: 5, scope: !42)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 30, column: 5, scope: !11)
!57 = !DILocation(line: 30, column: 7, scope: !11)
!58 = !DILocation(line: 30, column: 10, scope: !11)
!59 = !DILocation(line: 32, column: 10, scope: !11)
!60 = !DILocation(line: 32, column: 5, scope: !11)
!61 = !DILocation(line: 33, column: 1, scope: !11)
