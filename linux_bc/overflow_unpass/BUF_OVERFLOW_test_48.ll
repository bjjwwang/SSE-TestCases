; ModuleID = 'linux_bc/overflow_unpass/BUF_OVERFLOW_test_48.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_48.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [32 x i32], align 16
  %counter = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [32 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 0, i32* %counter, align 4, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %i, metadata !40, metadata !DIExpression()), !dbg !42
  store i32 0, i32* %i, align 4, !dbg !42
  br label %for.cond, !dbg !43

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !44
  %cmp = icmp sle i32 %0, 127, !dbg !46
  br i1 %cmp, label %for.body, label %for.end, !dbg !47

for.body:                                         ; preds = %for.cond
  %call = call i16** @__ctype_b_loc() #3, !dbg !48
  %1 = load i16*, i16** %call, align 8, !dbg !48
  %2 = load i32, i32* %i, align 4, !dbg !48
  %idxprom = sext i32 %2 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i16, i16* %1, i64 %idxprom, !dbg !48
  %3 = load i16, i16* %arrayidx, align 2, !dbg !48
  %conv = zext i16 %3 to i32, !dbg !48
  %and = and i32 %conv, 4, !dbg !48
  %tobool = icmp ne i32 %and, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.end, !dbg !51

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %counter, align 4, !dbg !52
  %inc = add nsw i32 %4, 1, !dbg !52
  store i32 %inc, i32* %counter, align 4, !dbg !52
  br label %if.end, !dbg !54

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !55

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !56
  %inc1 = add nsw i32 %5, 1, !dbg !56
  store i32 %inc1, i32* %i, align 4, !dbg !56
  br label %for.cond, !dbg !57, !llvm.loop !58

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %counter, align 4, !dbg !61
  %idxprom2 = sext i32 %6 to i64, !dbg !62
  %arrayidx3 = getelementptr inbounds [32 x i32], [32 x i32]* %buffer, i64 0, i64 %idxprom2, !dbg !62
  store i32 1, i32* %arrayidx3, align 4, !dbg !63
  %7 = load i32, i32* %retval, align 4, !dbg !64
  ret i32 %7, !dbg !64
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/overflow_unpass/BUF_OVERFLOW_test_48.c", directory: "/home/SVF-tools/SSE-TestCases")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !4, line: 46, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "/usr/include/ctype.h", directory: "")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16, !17, !18}
!7 = !DIEnumerator(name: "_ISupper", value: 256)
!8 = !DIEnumerator(name: "_ISlower", value: 512)
!9 = !DIEnumerator(name: "_ISalpha", value: 1024)
!10 = !DIEnumerator(name: "_ISdigit", value: 2048)
!11 = !DIEnumerator(name: "_ISxdigit", value: 4096)
!12 = !DIEnumerator(name: "_ISspace", value: 8192)
!13 = !DIEnumerator(name: "_ISprint", value: 16384)
!14 = !DIEnumerator(name: "_ISgraph", value: 32768)
!15 = !DIEnumerator(name: "_ISblank", value: 1)
!16 = !DIEnumerator(name: "_IScntrl", value: 2)
!17 = !DIEnumerator(name: "_ISpunct", value: 4)
!18 = !DIEnumerator(name: "_ISalnum", value: 8)
!19 = !{!20, !21}
!20 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!21 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!22 = !{i32 7, !"Dwarf Version", i32 4}
!23 = !{i32 2, !"Debug Info Version", i32 3}
!24 = !{i32 1, !"wchar_size", i32 4}
!25 = !{i32 7, !"uwtable", i32 1}
!26 = !{i32 7, !"frame-pointer", i32 2}
!27 = !{!"clang version 13.0.0"}
!28 = distinct !DISubprogram(name: "main", scope: !29, file: !29, line: 8, type: !30, scopeLine: 8, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !32)
!29 = !DIFile(filename: "src/overflow_unpass/BUF_OVERFLOW_test_48.c", directory: "/home/SVF-tools/SSE-TestCases")
!30 = !DISubroutineType(types: !31)
!31 = !{!20}
!32 = !{}
!33 = !DILocalVariable(name: "buffer", scope: !28, file: !29, line: 9, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1024, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 32)
!37 = !DILocation(line: 9, column: 9, scope: !28)
!38 = !DILocalVariable(name: "counter", scope: !28, file: !29, line: 10, type: !20)
!39 = !DILocation(line: 10, column: 6, scope: !28)
!40 = !DILocalVariable(name: "i", scope: !41, file: !29, line: 11, type: !20)
!41 = distinct !DILexicalBlock(scope: !28, file: !29, line: 11, column: 5)
!42 = !DILocation(line: 11, column: 14, scope: !41)
!43 = !DILocation(line: 11, column: 10, scope: !41)
!44 = !DILocation(line: 11, column: 21, scope: !45)
!45 = distinct !DILexicalBlock(scope: !41, file: !29, line: 11, column: 5)
!46 = !DILocation(line: 11, column: 23, scope: !45)
!47 = !DILocation(line: 11, column: 5, scope: !41)
!48 = !DILocation(line: 12, column: 12, scope: !49)
!49 = distinct !DILexicalBlock(scope: !50, file: !29, line: 12, column: 12)
!50 = distinct !DILexicalBlock(scope: !45, file: !29, line: 11, column: 36)
!51 = !DILocation(line: 12, column: 12, scope: !50)
!52 = !DILocation(line: 13, column: 11, scope: !53)
!53 = distinct !DILexicalBlock(scope: !49, file: !29, line: 12, column: 24)
!54 = !DILocation(line: 14, column: 3, scope: !53)
!55 = !DILocation(line: 15, column: 5, scope: !50)
!56 = !DILocation(line: 11, column: 32, scope: !45)
!57 = !DILocation(line: 11, column: 5, scope: !45)
!58 = distinct !{!58, !47, !59, !60}
!59 = !DILocation(line: 15, column: 5, scope: !41)
!60 = !{!"llvm.loop.mustprogress"}
!61 = !DILocation(line: 17, column: 9, scope: !28)
!62 = !DILocation(line: 17, column: 2, scope: !28)
!63 = !DILocation(line: 17, column: 18, scope: !28)
!64 = !DILocation(line: 18, column: 1, scope: !28)
