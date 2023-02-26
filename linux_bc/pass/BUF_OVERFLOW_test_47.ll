; ModuleID = 'linux_bc/pass/BUF_OVERFLOW_test_47.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/BUF_OVERFLOW_test_47.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %buffer = alloca [58 x i32], align 16
  %randomNumber = alloca i32, align 4
  %ch = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata [58 x i32]* %buffer, metadata !33, metadata !DIExpression()), !dbg !37
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !38
  call void @srand(i32 %call) #5, !dbg !39
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !40, metadata !DIExpression()), !dbg !41
  %call1 = call i32 @rand() #5, !dbg !42
  %rem = srem i32 %call1, 128, !dbg !43
  store i32 %rem, i32* %randomNumber, align 4, !dbg !41
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !44, metadata !DIExpression()), !dbg !46
  %0 = load i32, i32* %randomNumber, align 4, !dbg !47
  %conv = trunc i32 %0 to i8, !dbg !47
  store i8 %conv, i8* %ch, align 1, !dbg !46
  %call2 = call i16** @__ctype_b_loc() #6, !dbg !48
  %1 = load i16*, i16** %call2, align 8, !dbg !48
  %2 = load i8, i8* %ch, align 1, !dbg !48
  %conv3 = sext i8 %2 to i32, !dbg !48
  %idxprom = sext i32 %conv3 to i64, !dbg !48
  %arrayidx = getelementptr inbounds i16, i16* %1, i64 %idxprom, !dbg !48
  %3 = load i16, i16* %arrayidx, align 2, !dbg !48
  %conv4 = zext i16 %3 to i32, !dbg !48
  %and = and i32 %conv4, 2048, !dbg !48
  %tobool = icmp ne i32 %and, 0, !dbg !48
  br i1 %tobool, label %if.then, label %if.else, !dbg !50

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %randomNumber, align 4, !dbg !51
  %idxprom5 = sext i32 %4 to i64, !dbg !53
  %arrayidx6 = getelementptr inbounds [58 x i32], [58 x i32]* %buffer, i64 0, i64 %idxprom5, !dbg !53
  store i32 1, i32* %arrayidx6, align 4, !dbg !54
  br label %if.end, !dbg !55

if.else:                                          ; preds = %entry
  %5 = load i32, i32* %randomNumber, align 4, !dbg !56
  %idxprom7 = sext i32 %5 to i64, !dbg !58
  %arrayidx8 = getelementptr inbounds [58 x i32], [58 x i32]* %buffer, i64 0, i64 %idxprom7, !dbg !58
  store i32 1, i32* %arrayidx8, align 4, !dbg !59
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !60
  ret i32 %6, !dbg !60
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind
declare dso_local void @srand(i32) #2

declare dso_local i32 @time(...) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #2

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #4

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/BUF_OVERFLOW_test_47.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!29 = !DIFile(filename: "src/pass/BUF_OVERFLOW_test_47.c", directory: "/home/SVF-tools/SSE-TestCases")
!30 = !DISubroutineType(types: !31)
!31 = !{!20}
!32 = !{}
!33 = !DILocalVariable(name: "buffer", scope: !28, file: !29, line: 9, type: !34)
!34 = !DICompositeType(tag: DW_TAG_array_type, baseType: !20, size: 1856, elements: !35)
!35 = !{!36}
!36 = !DISubrange(count: 58)
!37 = !DILocation(line: 9, column: 6, scope: !28)
!38 = !DILocation(line: 10, column: 11, scope: !28)
!39 = !DILocation(line: 10, column: 5, scope: !28)
!40 = !DILocalVariable(name: "randomNumber", scope: !28, file: !29, line: 11, type: !20)
!41 = !DILocation(line: 11, column: 6, scope: !28)
!42 = !DILocation(line: 11, column: 21, scope: !28)
!43 = !DILocation(line: 11, column: 28, scope: !28)
!44 = !DILocalVariable(name: "ch", scope: !28, file: !29, line: 12, type: !45)
!45 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!46 = !DILocation(line: 12, column: 10, scope: !28)
!47 = !DILocation(line: 12, column: 15, scope: !28)
!48 = !DILocation(line: 13, column: 9, scope: !49)
!49 = distinct !DILexicalBlock(scope: !28, file: !29, line: 13, column: 9)
!50 = !DILocation(line: 13, column: 9, scope: !28)
!51 = !DILocation(line: 15, column: 10, scope: !52)
!52 = distinct !DILexicalBlock(scope: !49, file: !29, line: 13, column: 22)
!53 = !DILocation(line: 15, column: 3, scope: !52)
!54 = !DILocation(line: 15, column: 24, scope: !52)
!55 = !DILocation(line: 16, column: 5, scope: !52)
!56 = !DILocation(line: 19, column: 10, scope: !57)
!57 = distinct !DILexicalBlock(scope: !49, file: !29, line: 17, column: 10)
!58 = !DILocation(line: 19, column: 3, scope: !57)
!59 = !DILocation(line: 19, column: 24, scope: !57)
!60 = !DILocation(line: 21, column: 1, scope: !28)
