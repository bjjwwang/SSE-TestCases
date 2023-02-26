; ModuleID = 'linux_bc/pass/INTERVAL_test_28.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_28.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %counter = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata i32* %counter, metadata !33, metadata !DIExpression()), !dbg !34
  store i32 0, i32* %counter, align 4, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %i, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 0, i32* %i, align 4, !dbg !37
  br label %for.cond, !dbg !38

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4, !dbg !39
  %cmp = icmp sle i32 %0, 127, !dbg !41
  br i1 %cmp, label %for.body, label %for.end, !dbg !42

for.body:                                         ; preds = %for.cond
  %call = call i16** @__ctype_b_loc() #4, !dbg !43
  %1 = load i16*, i16** %call, align 8, !dbg !43
  %2 = load i32, i32* %i, align 4, !dbg !43
  %idxprom = sext i32 %2 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i16, i16* %1, i64 %idxprom, !dbg !43
  %3 = load i16, i16* %arrayidx, align 2, !dbg !43
  %conv = zext i16 %3 to i32, !dbg !43
  %and = and i32 %conv, 4, !dbg !43
  %tobool = icmp ne i32 %and, 0, !dbg !43
  br i1 %tobool, label %if.then, label %if.end, !dbg !46

if.then:                                          ; preds = %for.body
  %4 = load i32, i32* %counter, align 4, !dbg !47
  %inc = add nsw i32 %4, 1, !dbg !47
  store i32 %inc, i32* %counter, align 4, !dbg !47
  br label %if.end, !dbg !49

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !50

for.inc:                                          ; preds = %if.end
  %5 = load i32, i32* %i, align 4, !dbg !51
  %inc1 = add nsw i32 %5, 1, !dbg !51
  store i32 %inc1, i32* %i, align 4, !dbg !51
  br label %for.cond, !dbg !52, !llvm.loop !53

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %counter, align 4, !dbg !56
  %cmp2 = icmp eq i32 %6, 32, !dbg !57
  call void @svf_assert(i1 zeroext %cmp2), !dbg !58
  %7 = load i32, i32* %retval, align 4, !dbg !59
  ret i32 %7, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #2

declare dso_local void @svf_assert(i1 zeroext) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_28.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!28 = distinct !DISubprogram(name: "main", scope: !29, file: !29, line: 7, type: !30, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !32)
!29 = !DIFile(filename: "src/pass/INTERVAL_test_28.c", directory: "/home/SVF-tools/SSE-TestCases")
!30 = !DISubroutineType(types: !31)
!31 = !{!20}
!32 = !{}
!33 = !DILocalVariable(name: "counter", scope: !28, file: !29, line: 8, type: !20)
!34 = !DILocation(line: 8, column: 9, scope: !28)
!35 = !DILocalVariable(name: "i", scope: !36, file: !29, line: 9, type: !20)
!36 = distinct !DILexicalBlock(scope: !28, file: !29, line: 9, column: 5)
!37 = !DILocation(line: 9, column: 14, scope: !36)
!38 = !DILocation(line: 9, column: 10, scope: !36)
!39 = !DILocation(line: 9, column: 21, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !29, line: 9, column: 5)
!41 = !DILocation(line: 9, column: 23, scope: !40)
!42 = !DILocation(line: 9, column: 5, scope: !36)
!43 = !DILocation(line: 10, column: 12, scope: !44)
!44 = distinct !DILexicalBlock(scope: !45, file: !29, line: 10, column: 12)
!45 = distinct !DILexicalBlock(scope: !40, file: !29, line: 9, column: 36)
!46 = !DILocation(line: 10, column: 12, scope: !45)
!47 = !DILocation(line: 11, column: 11, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !29, line: 10, column: 24)
!49 = !DILocation(line: 12, column: 3, scope: !48)
!50 = !DILocation(line: 13, column: 5, scope: !45)
!51 = !DILocation(line: 9, column: 32, scope: !40)
!52 = !DILocation(line: 9, column: 5, scope: !40)
!53 = distinct !{!53, !42, !54, !55}
!54 = !DILocation(line: 13, column: 5, scope: !36)
!55 = !{!"llvm.loop.mustprogress"}
!56 = !DILocation(line: 14, column: 13, scope: !28)
!57 = !DILocation(line: 14, column: 21, scope: !28)
!58 = !DILocation(line: 14, column: 2, scope: !28)
!59 = !DILocation(line: 15, column: 1, scope: !28)
