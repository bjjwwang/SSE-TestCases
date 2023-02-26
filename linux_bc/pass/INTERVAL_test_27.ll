; ModuleID = 'linux_bc/pass/INTERVAL_test_27.ll'
source_filename = "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_27.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !28 {
entry:
  %retval = alloca i32, align 4
  %randomNumber = alloca i32, align 4
  %ch = alloca i8, align 1
  store i32 0, i32* %retval, align 4
  %call = call i32 (i32, ...) bitcast (i32 (...)* @time to i32 (i32, ...)*)(i32 0), !dbg !33
  call void @srand(i32 %call) #5, !dbg !34
  call void @llvm.dbg.declare(metadata i32* %randomNumber, metadata !35, metadata !DIExpression()), !dbg !36
  %call1 = call i32 @rand() #5, !dbg !37
  %rem = srem i32 %call1, 128, !dbg !38
  store i32 %rem, i32* %randomNumber, align 4, !dbg !36
  call void @llvm.dbg.declare(metadata i8* %ch, metadata !39, metadata !DIExpression()), !dbg !41
  %0 = load i32, i32* %randomNumber, align 4, !dbg !42
  %conv = trunc i32 %0 to i8, !dbg !42
  store i8 %conv, i8* %ch, align 1, !dbg !41
  %call2 = call i16** @__ctype_b_loc() #6, !dbg !43
  %1 = load i16*, i16** %call2, align 8, !dbg !43
  %2 = load i8, i8* %ch, align 1, !dbg !43
  %conv3 = sext i8 %2 to i32, !dbg !43
  %idxprom = sext i32 %conv3 to i64, !dbg !43
  %arrayidx = getelementptr inbounds i16, i16* %1, i64 %idxprom, !dbg !43
  %3 = load i16, i16* %arrayidx, align 2, !dbg !43
  %conv4 = zext i16 %3 to i32, !dbg !43
  %and = and i32 %conv4, 2048, !dbg !43
  %tobool = icmp ne i32 %and, 0, !dbg !43
  br i1 %tobool, label %if.then, label %if.else, !dbg !45

if.then:                                          ; preds = %entry
  %4 = load i32, i32* %randomNumber, align 4, !dbg !46
  %cmp = icmp sge i32 %4, 48, !dbg !48
  br i1 %cmp, label %land.rhs, label %land.end, !dbg !49

land.rhs:                                         ; preds = %if.then
  %5 = load i32, i32* %randomNumber, align 4, !dbg !50
  %cmp6 = icmp sle i32 %5, 57, !dbg !51
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.then
  %6 = phi i1 [ false, %if.then ], [ %cmp6, %land.rhs ], !dbg !52
  call void @svf_assert(i1 zeroext %6), !dbg !53
  br label %if.end, !dbg !54

if.else:                                          ; preds = %entry
  %7 = load i32, i32* %randomNumber, align 4, !dbg !55
  %cmp8 = icmp slt i32 %7, 48, !dbg !57
  br i1 %cmp8, label %lor.end, label %lor.rhs, !dbg !58

lor.rhs:                                          ; preds = %if.else
  %8 = load i32, i32* %randomNumber, align 4, !dbg !59
  %cmp10 = icmp sgt i32 %8, 57, !dbg !60
  br label %lor.end, !dbg !58

lor.end:                                          ; preds = %lor.rhs, %if.else
  %9 = phi i1 [ true, %if.else ], [ %cmp10, %lor.rhs ]
  call void @svf_assert(i1 zeroext %9), !dbg !61
  br label %if.end

if.end:                                           ; preds = %lor.end, %land.end
  %10 = load i32, i32* %retval, align 4, !dbg !62
  ret i32 %10, !dbg !62
}

; Function Attrs: nounwind
declare dso_local void @srand(i32) #1

declare dso_local i32 @time(...) #2

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #3

; Function Attrs: nounwind
declare dso_local i32 @rand() #1

; Function Attrs: nounwind readnone willreturn
declare dso_local i16** @__ctype_b_loc() #4

declare dso_local void @svf_assert(i1 zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }
attributes #6 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!22, !23, !24, !25, !26}
!llvm.ident = !{!27}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.0", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !19, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "/home/SVF-tools/SSE-TestCases/src/pass/INTERVAL_test_27.c", directory: "/home/SVF-tools/SSE-TestCases")
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
!29 = !DIFile(filename: "src/pass/INTERVAL_test_27.c", directory: "/home/SVF-tools/SSE-TestCases")
!30 = !DISubroutineType(types: !31)
!31 = !{!20}
!32 = !{}
!33 = !DILocation(line: 8, column: 11, scope: !28)
!34 = !DILocation(line: 8, column: 5, scope: !28)
!35 = !DILocalVariable(name: "randomNumber", scope: !28, file: !29, line: 9, type: !20)
!36 = !DILocation(line: 9, column: 6, scope: !28)
!37 = !DILocation(line: 9, column: 21, scope: !28)
!38 = !DILocation(line: 9, column: 28, scope: !28)
!39 = !DILocalVariable(name: "ch", scope: !28, file: !29, line: 10, type: !40)
!40 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!41 = !DILocation(line: 10, column: 10, scope: !28)
!42 = !DILocation(line: 10, column: 15, scope: !28)
!43 = !DILocation(line: 11, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !28, file: !29, line: 11, column: 9)
!45 = !DILocation(line: 11, column: 9, scope: !28)
!46 = !DILocation(line: 12, column: 14, scope: !47)
!47 = distinct !DILexicalBlock(scope: !44, file: !29, line: 11, column: 22)
!48 = !DILocation(line: 12, column: 27, scope: !47)
!49 = !DILocation(line: 12, column: 33, scope: !47)
!50 = !DILocation(line: 12, column: 36, scope: !47)
!51 = !DILocation(line: 12, column: 49, scope: !47)
!52 = !DILocation(line: 0, scope: !47)
!53 = !DILocation(line: 12, column: 3, scope: !47)
!54 = !DILocation(line: 13, column: 5, scope: !47)
!55 = !DILocation(line: 15, column: 14, scope: !56)
!56 = distinct !DILexicalBlock(scope: !44, file: !29, line: 14, column: 10)
!57 = !DILocation(line: 15, column: 27, scope: !56)
!58 = !DILocation(line: 15, column: 32, scope: !56)
!59 = !DILocation(line: 15, column: 35, scope: !56)
!60 = !DILocation(line: 15, column: 48, scope: !56)
!61 = !DILocation(line: 15, column: 3, scope: !56)
!62 = !DILocation(line: 17, column: 1, scope: !28)
